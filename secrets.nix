let
  hosts = {
    lemp11 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEZ+ljJKd6uqdAk+fqxwtObI4Stab2N9Bjo4QFHY/v8n";
    nixedo = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILvtcGJnc94k6wCPfvK9oBvGey0WWVCR8IYSqg5vqage";
    t480 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILvtcGJnc94k6wCPfvK9oBvGey0WWVCR8IYSqg5vqage";
  };

  users = {
    opdavies = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDkkbYaCD9NUIQT0NnsmlyfepwjxBYeiJSBCotOpdPTyc5inFAd29DiVw98j4skfaHdzjcqWmMFmDQWM6tGkK7eg8n0WuaABmsjdEbzTtfjHwM0tRDCIh5AtoT4IvoLhwLjEI2jKM05BGCQ2m5lS//AYJK1DjiV4UH+IjXHz6oy/3eFzQwANjxWS+mbR565p21yuAu1DKEyaGeVzT1xDhgzlnZG7Cys/rFgUYpIvYDHMOFxG6hsDB8vqyHiTXniniti5tdvGGYHgRGQcynRTU12aerrqHTIOefrElXJdf3/PA8FIY/Pd3MmZocY/vvQe0EVHXWrNtnHOF3MFQ1tFyfubKO51Dcp9KmzHnyBvO4CtvGVr/upSVWfo0I/EqkIqvCvBbdSIPeH9V5hAcyWENGF4Wf0/Yqtc0dBhfXJmPVBsC2ghZp9oERK+h5Xs7DpzkT0vtkN+wjgA5weIuG8e2UVNO29LWASzlychVqb7BVa6kNn5CyGwauyIGsYvAFnUjkyJpK8qleNM3VO5x9aw26IhSKlnSE9PAdX8p7PpdoWfxWRekKTc4h6iAe7pFOENvuokAvCNsE5LolR4VrYKXjA0m3nupDNWYexAWfR3lSeSlKd9nD3OENS0biJKayZHs11iDUTxm5u5gm/U60b4z0zDXjh1H/DI/pSCG6jjaXDpw==";
  };
in
{
  "secrets/cloudflare.age".publicKeys = [
    hosts.nixedo
    hosts.t480
  ]
  ++ [ users.opdavies ];

  "secrets/cloudflared-credentials.age".publicKeys = [
    hosts.nixedo
  ]
  ++ [ users.opdavies ];

  "secrets/forgejo-runner-token.age".publicKeys = [
    hosts.nixedo
  ]
  ++ [ users.opdavies ];

  "secrets/peertube-env.age".publicKeys = [
    hosts.nixedo
  ]
  ++ [ users.opdavies ];

  "secrets/tubearchivist-env.age".publicKeys = [
    hosts.nixedo
    hosts.t480
  ]
  ++ [ users.opdavies ];
}
