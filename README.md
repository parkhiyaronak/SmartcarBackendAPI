# Smartcar Backend API

Welcome! You will find APIs for Smartcar which needs to adapt the Generic Motors (GM) car company's API into a cleaner format. 

Following gems are used while building this API:

* RSpec (https://github.com/rspec/rspec) for Testing the APIs

* Jbuilder (https://github.com/rails/jbuilder) for JSON view

* httparty (https://github.com/jnunemaker/httparty) for making http request


## Usage



* **Vehicle Info** <br />

**Request:** GET /vehicles/:id <br />

**Response:** <br />

```ruby
{
  	"vin": "1213231",
  	"color": "Metallic Silver",
  	"doorCount": 4,
  	"driveTrain": "v8"
}
````

* **Security** <br />

**Request:** /vehicles/:id/doors <br />

**Response:** <br />

```ruby
[
  {
    "location": "frontLeft",
    "locked": true
  },
  {
    "location": "frontRight",
    "locked": true
  }
]
````

* **Fuel Range** <br />

**Request:** /vehicles/:id/fuel <br />

**Response:** <br />

```ruby
{
  "percent": 30
}
````

* **Battery Range** <br />

**Request:** /vehicles/:id/battery <br />

**Response:** <br />

```ruby
{
  "percent": 50
}
````

* **Start/Stop Range** <br />

**Request:** /vehicles/:id/engine <br />

**Response:** <br />

```ruby
{
  "status": "success|error"
}
````