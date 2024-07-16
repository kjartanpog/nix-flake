{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      inter
      (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
    ];
    fontconfig = {
      localConf = ''
        <match target="font">
            <test qual="any" name="family"><string>Inter</string></test>
            <!-- These are set with "prepend" so that applications which configure features don't get overridden -->
            <edit name="fontfeatures" mode="prepend">
                <string>tnum</string><!-- Tabular numbers -->
                <string>frac</string><!-- Fractions -->
                <string>zero</string><!-- Slashed Zero -->
                <string>ss02</string><!-- Disambiguation -->
            </edit>
        </match>
      '';
    };
  };
}
