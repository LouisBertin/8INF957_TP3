import agent.Move;

public aspect AspectLogger {
    pointcut greeting(Move mv) : call (* items.Board.movePiece(Move)) && args(mv);

    after(Move mv) : greeting(mv) {
        toto();
    }

    public void toto() {
        System.err.println("toto");
    }
}