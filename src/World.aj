public aspect World {
    pointcut greeting() : execution (* HelloTest.sayHello(..));

    after() returning() : greeting() {
        System.out.println("World");
    }
}