{ pkgs, ... }:

{
  home.packages = with pkgs; [ trashy ];

  home.file.".config/lf/icons".source = ./icons;
  home.file.".config/lf/colors".source = ./colors;

  programs.lf = {
    enable = true;

    settings = {
      preview = true;
      hidden = true;
      icons = true;
      ignorecase = true;
      drawbox = true;
      relativenumber = true;
    };

    keybindings = {
      y = "copy";
      x = "cut";
      p = "paste";
      o = "open";
      O = "editor-open";
      md = "mkdir";
      mf = "mkfile";
      dd = "trash";
      r = "rename";
      az = "zip";
      at = "tar";
      ag = "targz";
      au = "unarchive";

      m = "";
      d = "";
    };

    commands = {
      open = ''
        ''${{
        case $(${pkgs.file}/bin/file --mime-type -b "$f") in
          application/pdf) ${pkgs.termpdfpy}/bin/termpdf.py "$f";;
          application/epub+zip) ${pkgs.epy}/bin/epy "$f";;
          *) ${pkgs.bat}/bin/bat --paging=always --style=numbers,changes "$f";;
        esac
        }}
      '';
      editor-open = ''$$EDITOR $f'';
      mkdir = ''
        %{{
        printf "Directory name: "
        read DIR
        mkdir "$DIR"
        }}
      '';
      mkfile = ''
        %{{
        printf "File name: "
        read FILE 
        touch "$FILE"
        }}
      '';
      delete = ''
        %{{ 
        rm -r "$f"
        }}
      '';
      trash = ''
        %{{
        ${pkgs.trashy}/bin/trash put "$f"
        }}
      '';
      rename = ''
        %{{
        printf "New name: "
        read NAME 
        mv "$f" "$NAME"
        }}
      '';
      tar = ''
        %{{
        tar -cf "$f.tar" "$f"
        }}
      '';
      targz = ''
        %{{
        tar -czf $f.tar.gz "$f"
        }}
      '';
      zip = ''
        %{{
        ${pkgs.zip}/bin/zip -r "$f.zip" "$f"
        }}
      '';
      unarchive = ''
        %{{
        case "$f" in
          *.zip) ${pkgs.unzip}/bin/unzip "$f" ;;
          *.tar.gz) tar -xzvf "$f" ;;
          *.tar.bz2) tar -xjvf "$f" ;;
          *.tar) tar -xvf "$f" ;;
          *)echo "Unsupported format" ;;
        esac
        }}
      '';
      on-select = ''
        &{{
          lf -remote "send $id set statfmt \"$(eza -ld --color=always "$f" | sed 's/\\/\\\\/g;s/"/\\"/g')\""
        }}
      '';
    };

    extraConfig = 
    let 
      previewer = pkgs.writeShellScriptBin "pv.sh" ''
        file=$1
        w=$2
        h=$3
        x=$4
        y=$5
        
        if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
          ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
          exit 1
        fi

        ${pkgs.bat}/bin/bat --paging=always --style=plain --color=always "$file"
      '';

      cleaner = pkgs.writeShellScriptBin "clean.sh" ''
        ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
      '';
    in
    ''
      set cleaner ${cleaner}/bin/clean.sh
      set previewer ${previewer}/bin/pv.sh
    '';
  };
}
