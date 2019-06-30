$dnsConfiguration = @(
    @{
        "ZoneName" = "xtremeidiots.com"
        "DnsEntries" = @(
            @{
                "type" = "A"
                "name" = "mod-mc.xtremeidiots.com"
                "content" = "192.95.22.174"
                "ttl" = 1
            }
            @{
                "type" = "A"
                "name" = "sf3.xtremeidiots.com"
                "content" = "192.95.38.141"
                "ttl" = 1
            }
            @{
                "type" = "A"
                "name" = "ts.xtremeidiots.com"
                "content" = "192.95.39.66"
                "ttl" = 1
            }
            @{
                "type" = "CNAME"
                "name" = "autodiscover.xtremeidiots.com"
                "content" = "autodiscover.outlook.com"
                "ttl" = 1
            }
            @{
                "type" = "CNAME"
                "name" = "cdn.xtremeidiots.com"
                "content" = "xtremeidiotsforums-live.pcdqwmijaj.us-east-2.elasticbeanstalk.com"
                "ttl" = 1
                "proxied" = $true
            }
            @{
                "type" = "CNAME"
                "name" = "portal.xtremeidiots.com"
                "content" = "xtremeidiotsportal-live.uqrpz33mvb.us-east-2.elasticbeanstalk.com"
                "ttl" = 1
                "proxied" = $true
            }
            @{
                "type" = "CNAME"
                "name" = "test-portal.xtremeidiots.com"
                "content" = "xtremeidiotsportal-test.uqrpz33mvb.us-east-2.elasticbeanstalk.com"
                "ttl" = 1
                "proxied" = $true
            }
            @{
                "type" = "CNAME"
                "name" = "test.xtremeidiots.com"
                "content" = "xtremeidiotsforums-test.pcdqwmijaj.us-east-2.elasticbeanstalk.com"
                "ttl" = 1
                "proxied" = $true
            }
            @{
                "type" = "CNAME"
                "name" = "www.xtremeidiots.com"
                "content" = "xtremeidiotsforums-live.pcdqwmijaj.us-east-2.elasticbeanstalk.com"
                "ttl" = 1
                "proxied" = $true
            }
            @{
                "type" = "CNAME"
                "name" = "xtremeidiots.com"
                "content" = "xtremeidiotsforums-live.pcdqwmijaj.us-east-2.elasticbeanstalk.com"
                "ttl" = 1
                "proxied" = $true
            }
            @{
                "type" = "MX"
                "name" = "xtremeidiots.com"
                "content" = "570375760.pamx1.hotmail.com"
                "priority" = 1
                "ttl" = 1
            }
            @{
                "type" = "SRV"
                "name" = "_ts3._udp.ts.xtremeidiots.com"
                "ttl" = 1
                "data" = @{
                    "service" = "_ts3"
                    "proto" = "_udp"
                    "name" = "ts"
                    "weight" = 1
                    "port" = 9182
                    "target" = "ts.xtremeidiots.com"
                    "priority" = 1
                }
            }
            @{
                "type" = "TXT"
                "name" = "mandrill._domainkey.xtremeidiots.com"
                "content" = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;"
                "ttl" = 1
            }
            @{
                "type" = "TXT"
                "name" = "xtremeidiots.com"
                "content" = "MS=ms570375760"
                "ttl" = 1
            }
            @{
                "type" = "TXT"
                "name" = "xtremeidiots.com"
                "content" = "v=spf1 mx a:outlook.com include:spf.mandrillapp.com"
                "ttl" = 1
            }
        )
    }
)