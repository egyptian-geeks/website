# Services

## Purpose

Holds logic concerned with multiple models.

## Properties

All classes in this directory obey these rules:

* Any class inherits `ApplicationService`
* `ApplicationService` has a class method `call` to takes any argument and pass
  it to the initializer then calls the service logic `call`
* it has an initializer that takes any number of arguments required to perform
  the task
* it exposes one instance method `call` that does the service logic
* All other methods are private
