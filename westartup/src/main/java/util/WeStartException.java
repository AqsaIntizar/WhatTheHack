package util;

public class WeStartException extends RuntimeException {

    public WeStartException(String msg, Exception innerException) {
        super(msg, innerException);
    }

}
