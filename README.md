# progLipsum

progLipsum ([http://proglipsum.com](http://proglipsum.com)) is a Rails 3 web app designed to make it easy to generate test data. The idea was born out of a need for constantly varied data to use when testing other apps. The initial version was coded during the 2012 Rails Rumble. Since then, the core data generation has been abstracted to its own gem, [`mannequin`](https://github.com/theandym/mannequin).

## Installation

To install, please clone the app and run `bundler` to install / update any necessary gems.

    # Clone app
    $ git clone https://github.com/theandym/proglipsum.git
    
    # Run Bundler
    $ cd proglipsum
    $ bundle

No other setup is necessary to try out the app - just run `rails s` and visit [http://localhost:3000/](http://localhost:3000/).

If, however, you are planning on running it in a `production` environment, you must set the secret_token as an environment variable. For example, if you are hosting the app on Heroku, you can do the following after pushing it for the first time:

    # Generate a new secret token
    $ rake secret
    
    # Set the secret token as an environment variable
    $ heroku config:set SECRET_TOKEN=<insert_generated_secret_token>

This will set the secret_token for that installation and restart the Heroku app.

## Usage

This app free and open-source. It can be used by anyone to define custom data formats and populate the formats with data. Current data variables are dependent on those defined by the [`mannequin`](https://github.com/theandym/mannequin) gem.

## Contributing

Contributions to this app, or to the [`mannequin`](https://github.com/theandym/mannequin) gem, are welcome. Such contributions could take the form of adding new variable types, in which case contributions to both would be appreciated (although not necessary). Or they might come on their own as enhancements or new features. Either way, the following steps apply:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
