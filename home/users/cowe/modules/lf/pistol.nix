{ pkgs, ... }:

{
  programs.pistol = {
    enable = true;
    associations = [ 
      {
        mime = "application/json";
        command = "${pkgs.bat}/bin/bat %pistol-filename%";
      }
      {
        fpath = ".*.md$";
        command = "${pkgs.bat}/bin/bat %pistol-filename%";
      }
      {
        fpath = ".*.dll$";
        command = "${pkgs.exiftool}/bin/exiftool %pistol-filename%";
      }
      {
        fpath = ".*.exe$";
        command = "${pkgs.exiftool}/bin/exiftool %pistol-filename%";
      }
      {
        fpath = ".*.ttf$";
        command = "${pkgs.exiftool}/bin/exiftool %pistol-filename%";
      }
      {
        fpath = ".*.woff$";
        command = "${pkgs.exiftool}/bin/exiftool %pistol-filename%";
      }
      {
        fpath = ".*.otf$";
        command = "${pkgs.exiftool}/bin/exiftool %pistol-filename%";
      }
      {
        fpath = ".*.eot$";
        command = "${pkgs.exiftool}/bin/exiftool %pistol-filename%";
      }
      {
        fpath = ".*.tar$";
        command = "tar tf %pistol-filename%";
      }
      {
        fpath = ".*.tar.gz$";
        command = "tar tf %pistol-filename%";
      }
      {
        mime = "application/zip";
        command = "${pkgs.p7zip}/bin/7z l %pistol-filename%";
      }
      {
        mime = "application/java-archive";
        command = "${pkgs.p7zip}/bin/7z l %pistol-filename%";
      }
      {
        mime = "application/vnd.rar";
        command = "${pkgs.p7zip}/bin/7z l %pistol-filename%";
      }
      {
        mime = "application/x-7z-compressed";
        command = "${pkgs.p7zip}/bin/7z l %pistol-filename%";
      }
      {
        mime = "application/pdf";
        command = "${pkgs.poppler_utils}/bin/pdftotext %pistol-filename% -";
      }
      {
        mime = "application/*";
        command = "${pkgs.hexyl}/bin/hexyl %pistol-filename%";
      }
      {
        mime = "text/*";
        command = "${pkgs.bat}/bin/bat --paging=always --style=plain --color=always %pistol-filename%";
      }
    ];
  };
}
