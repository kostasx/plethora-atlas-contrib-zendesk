got = require 'got'

userAgent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36'

zendesk = 

  init: (options)->

    zendesk.subdomain = options.subdomain
    zendesk.username  = options.username
    zendesk.password  = options.password
    zendesk.token     = options.token

  checkForTickets: (options)->

    query = "type%3Aticket+status%3A" + options.type
    url   = "https://#{zendesk.subdomain}.zendesk.com/api/v2/search.json?query=#{query}"

    return got(url, {

      json    : true
      headers : 
        'Authorization' : 'Basic ' + new Buffer("#{zendesk.username}/token:#{zendesk.token}").toString('base64')
        'user-agent'    : userAgent

    })

module.exports = zendesk