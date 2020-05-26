# OmniAuth zoom

This gem contains the unofficial Zoom strategy for OmniAuth.

See the [authorization documentation](https://marketplace.zoom.us/docs/guides/auth/oauth for Zoom.

For more information about the API see https://marketplace.zoom.us/docs/api-reference/introduction.

## Basic Usage

    use OmniAuth::Builder do
      provider :zoom, ENV['ZOOM_CLIENT_ID'], ENV['ZOOM_CLIENT_SECRET']
    end


## Refreshing the access token

The retrieved ```access_token``` expires in one hour. So you need to retrieve a new token when it expires. You can do so using the ```refresh!``` method in OmniAuth. You will retrieve all new tokens so make sure you save both the ```access_token``` and ```refresh_token```.

Example:

```ruby
if Time.at( zoom_access_token_expires_at ).past?
  oauth = OmniAuth::Strategies::Zoom.new(nil, {
    client_id: ENV['zoom_CLIENT_ID'],
    client_secret: ENV['zoom_CLIENT_SECRET']
  }
  token = OAuth2::AccessToken.new(
    oauth.client,
    zoom_access_token,
    { refresh_token: zoom_refresh_token }
  )
  new_tokens = token.refresh!
end
```

You can then use the new ```access_token``` and when it expires you can use the new ```refresh_token``` to gain a new one.

## Credits

Based on [omniauth-37signals](https://github.com/tallgreentree/omniauth-37signals) by [Will Barrett](https://github.com/willbarrett).

## License

Copyright (c) 2017 by Espen Antonsen. [MIT License](LICENSE)