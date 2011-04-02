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
    @cython.cfunc
    def zero(self) -> cython.double:
        return 0
    @cython.ccall
    def zero2(self) -> cython.double:
        return 0

def test_exttype(a: MyExtType):
    """
    >>> test_exttype(MyExtType())
    Hello!
    """
    a.shout()
    return

def test_exttype_return():
    """
    >>> x, y = test_exttype_return()
    >>> isinstance(x, float) and isinstance(y, float)
    True
    """
    a = MyExtType()
    return (a.zero(), a.zero2())


@cython.ccall
def test_dummy(a: "an argument", b: None):
    """
    >>> test_dummy(1, 2)
    (1, 2)
    """
    return (a,b)

@cython.ccall
def test_return(x) -> cython.double:
    """
    >>> isinstance(test_return(1), float)
    True
    """
    return x

def test_return2(x) -> cython.double:
    """
    >>> isinstance(test_return(1), float)
    True
    """
    return x

@cython.cfunc
def test_return3(x) -> cython.double:
    """
    >>> isinstance(test_return(1), float)
    True
    """
    return x
