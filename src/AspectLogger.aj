import agent.Move;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public aspect AspectLogger {
    /**
     * Logger.
     */
    Logger logger = Logger.getLogger("MyLog");
    /**
     * FileHandler.
     */
    FileHandler fh;
    /**
     * Working directory.
     */
    public static final String WORKING_DIR = System.getProperty("user.dir");

    /**
     * Constructor.
     * @throws IOException
     */
    public AspectLogger() throws IOException {
        // init logger
        fh = new FileHandler(WORKING_DIR + "/src/output/results.txt");
        logger.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();
        fh.setFormatter(formatter);
    }

    /*
     * MovePiece pointcut.
     */
    pointcut movement(Move mv) : call (* items.Board.movePiece(Move)) && args(mv);
    after(Move mv) : movement(mv) {
        logger.info("[start] x : " + mv.xI + " y : " + mv.yI + " [end] x : " + mv.xF + " y : " + mv.yF);
    }
}