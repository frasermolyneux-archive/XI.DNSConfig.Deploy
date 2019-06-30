$dnsConfiguration = @(
    @{
        "ZoneName" = "xtremeidiots.net"
        "DnsEntries" = @(
            @{
                "type" = "A"
                "name" = "powershelltest1.xtremeidiots.net"
                "content" = "127.0.0.1"
                "ttl" = 1
            }
            @{
                "type" = "CNAME"
                "name" = "powershelltest2.xtremeidiots.net"
                "content" = "google2.co.uk"
                "ttl" = 1
            }
            @{
                "type" = "A"
                "name" = "gfer.xtremeidiots.net"
                "content" = "127.0.0.1"
                "ttl" = 1
            }
        )
    }
)