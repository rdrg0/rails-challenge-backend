# Bsale Challenge

Ruby on Rails server side application that consumes a MySQL database and responds through a REST api
## API
#### Base url: https://bsale-test-rdrg0.herokuapp.com


## Products
### Index
The API will automatically paginate the responses. You will receive 5 results per page by default.
But you can add the parameter `per_page` in order to retrieve more results per page.
Each resource contains an info object with information about the response.
```shell

GET https://bsale-test-rdrg0.herokuapp.com/products?per_page=60

{
  "info": {
    "count": 57,
    "pages": 1,
    "prev": null,
    "next": null
  },
  "results": [
    ...
    ]
 }
```
### Search
The API will automatically paginate the responses. You will receive products that match the query sent in the url parameters.
```shell
GET https://bsale-test-rdrg0.herokuapp.com/products?q=zero

{
  "info": {
    "count": 1,
    "pages": 1,
    "prev": null,
    "next": null
  },
  "results": [
    {
      "id": 37,
      "name": "COCA COLA ZERO DESECHABLE",
      "url_image": "https://dojiw2m9tvv09.cloudfront.net/11132/product/cocazero9766.jpg",
      "price": 1490.0,
      "discount": 0,
      "category": 4
    }
  ]
}
```
### Show
You will receive the product with the `id` sent in the url parameters
```shell
GET https://bsale-test-rdrg0.herokuapp.com/products/:id

{
  "id": 5,
  "name": "ENERGETICA MR BIG",
  "url_image": "https://dojiw2m9tvv09.cloudfront.net/11132/product/misterbig3308256.jpg",
  "price": 1490.0,
  "discount": 20,
  "category": 1
}
```
## Categories
### Index
You will receive all the product's categories

```shell
GET https://bsale-test-rdrg0.herokuapp.com/categories


  {
    "id": 1,
    "name": "bebida energetica"
  },
  {
    "id": 2,
    "name": "pisco"
  },
  {
    "id": 3,
    "name": "ron"
  },
  {
    "id": 4,
    "name": "bebida"
  },
  {
    "id": 5,
    "name": "snack"
  },
  {
    "id": 6,
    "name": "cerveza"
  },
  {
    "id": 7,
    "name": "vodka"
  }
]
```
### Show
You will receive all the products that belong to that belong to the category requested
```shell
GET https://bsale-test-rdrg0.herokuapp.com/categories/7

[
  {
    "id": 104,
    "name": "ABSOLUT",
    "url_image": "https://dojiw2m9tvv09.cloudfront.net/11132/product/absolut21381.png",
    "price": 8990.0,
    "discount": 30,
    "category": 7
  }
]
```




