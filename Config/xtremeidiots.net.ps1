$dnsConfiguration = @(
    @{
        "ZoneName" = "xtremeidiots.net"
        "DnsEntries" = @(
            @{
                "type" = "A"
                "name" = "ftp.xtremeidiots.net"
                "content" = "158.69.3.21"
                "ttl" = 1
            }
            @{
                "type" = "A"
                "name" = "minecraft-ftp.xtremeidiots.net"
                "content" = "144.217.255.171"
                "ttl" = 1
            }
            @{
                "type" = "A"
                "name" = "minecraft-rdp.xtremeidiots.net"
                "content" = "144.217.255.171"
                "ttl" = 1
            }
            @{
                "type" = "A"
                "name" = "multicraft.xtremeidiots.net"
                "content" = "144.217.255.171"
                "ttl" = 1
                "proxied" = $true
            }
            @{
                "type" = "A"
                "name" = "redirect.xtremeidiots.net"
                "content" = "144.217.22.232"
                "ttl" = 1
                "proxied" = $true
            }
            @{
                "type" = "CNAME"
                "name" = "sourcebans-mysql.xtremeidiots.net"
                "content" = "aa1uqn2xdm4ol0m.cs2um88u8ax2.us-east-2.rds.amazonaws.com"
                "ttl" = 1
            }
            @{
                "type" = "CNAME"
                "name" = "sourcebans.xtremeidiots.net"
                "content" = "xtremeidiotssourcebans-prd.qkpc3nsgzp.us-east-2.elasticbeanstalk.com"
                "ttl" = 1
                "proxied" = $true
            }
            @{
                "type" = "CNAME"
                "name" = "sourcebans-test.xtremeidiots.net"
                "content" = "xtremeidiotssourcebans-test.qkpc3nsgzp.us-east-2.elasticbeanstalk.com"
                "ttl" = 1
                "proxied" = $true
            }
        )
    }
)