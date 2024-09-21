{ ... }: {
  accounts.email.accounts = {
    personalProton = {
      primary = true;
      address = "kjartan.masson@proton.me";
      realName = "Kjartan Másson";
      userName = "kjartan.masson@proton.me";
      imap = {
        host = "127.0.0.1";
        port = 1143;
        tls.useStartTls = true;
      };
      smtp = {
        host = "127.0.0.1";
        port = 1025;
        tls.useStartTls = true;
      };
      # thunderbird = {
      #   enable = true;
      #   profiles = [ "kjartanMasson" ];
      # };
    };
    personalGmail = {
      # primary = true;
      address = "kjartan222@gmail.com";
      realName = "Kjartan Másson";
      userName = "kjartan222@gmail.com";
      imap = {
        host = "imap.gmail.com";
        port = 993;
        tls.enable = true;
      };
      smtp = {
        host = "smtp.gmail.com";
        port = 465;
        tls.enable = true;
      };
      # thunderbird = {
      #   enable = true;
      #   profiles = [ "kjartanMasson" ];
      #   settings = id: {
      #     # Authenticate OAuth2 through Thunderbird
      #     "mail.server.server_${id}.authMethod" = 10;
      #     "mail.smtpserver.smtp_${id}.authMethod" = 10;
      #   };
      # };
    };
  };
}
