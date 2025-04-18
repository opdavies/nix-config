{ config, ... }:

{
  services.cloudflared = {
    enable = true;

    tunnels."e1514105-327f-4984-974e-e2fbaca76466" = {
      credentialsFile = config.age.secrets.cloudflared.path;
      default = "http_status:404";

      ingress = {
        "bootstrap-with-tailwind.oliverdavies.uk" = "http://localhost:8000";
      };
    };
  };
}
