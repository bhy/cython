import cython

def test_foopy(x: cython.double):
    """
    >>> type(test_foopy(1))==float
    True
    """
    return x

@cython.cfunc
def foo(x: cython.double):
    return x

def test_foo():
    """
    >>> test_foo() == float
    True
    """
    return type(foo(1))

MyStruct = cython.struct(x=cython.int, y=cython.double)
@cython.cfunc
def feed_me_struct(a: MyStruct):
    return (a.x, a.y)

def test_struct():
    """
    >>> x, y = test_struct()
    >>> type(y) == float
    True
    >>> type(x) == int
    True
    """
    a = cython.declare(MyStruct)
    a.x = a.y = 1
    return feed_me_struct(a)

def test_typecheck(x: cython.double, y: cython.int):
    """
    >>> test_typecheck('abc', 2) #doctest: +ELLIPSIS
    Traceback (most recent call last):
        ...
    TypeError: ...
    >>> test_typecheck(1, 'def') #doctest: +ELLIPSIS
    Traceback (most recent call last):
        ...
    TypeError: ...
    """
    return x+y

@cython.cclass
class MyExtType(object):
    def shout(self):
        print("Hello!")
        return

def test_exttype(a: MyExtType):
    """
    >>> test_exttype(MyExtType())
    Hello!
    """
    a.shout()
    return
