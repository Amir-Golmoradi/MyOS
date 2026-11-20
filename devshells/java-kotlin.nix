{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [ jdk21 jdk25 kotlin gradle maven ];
  JAVA_HOME = "${pkgs.jdk21}";
  shellHook = ''
    echo "Java/Kotlin shell (JAVA_HOME = JDK 21; JDK 25 is also available)"
  '';
}
