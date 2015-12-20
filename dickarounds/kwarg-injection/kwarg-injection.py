test_attrs = {
    'name' : 'Joe Reynolds',
    'age'  : 25,
    'job'  : 'Software developer'
}

class Person():

    def __init__(self, kwargs):
        self.build(kwargs)

    def build(self, kwargs):
        for item in kwargs.keys():
            setattr(self, item, kwargs[item])


joe = Person(test_attrs) 
print(joe.name)
print(joe.age)

