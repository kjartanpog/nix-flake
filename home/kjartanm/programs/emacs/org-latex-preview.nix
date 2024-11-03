{
  trivialBuild,
  # fetchFromGitHub,
  # all-the-icons,
}:
trivialBuild rec {
  pname = "lambda-line";
  version = "main-23-11-2022";
  src = builtins.fetchGit {
    url = "https://code.tecosaur.net/tec/org-mode";
    ref = "refs/tags/release_9.7.10";
  };
  # elisp dependencies
  propagatedUserEnvPkgs = [
    # all-the-icons
  ];
  buildInputs = propagatedUserEnvPkgs;
}
