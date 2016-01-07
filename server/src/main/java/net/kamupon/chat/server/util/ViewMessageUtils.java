package net.kamupon.chat.server.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 画面のメッセージに関するユーティリティ
 * -------------------------
 * @author honda
 */
public class ViewMessageUtils {
    
    /** バリデーションメッセージのメッセージキー */
    private static final String VIOLATION_KEY = "violations";
    
    /** エラーメッセージのメッセージキー */
    private static final String ERROR_KEY = "globalErrorMessage";
    
    /** Successメッセージのメッセージキー */
    private static final String SUCCESS_KEY = "globalSuccessMessage";
    
    private ViewMessageUtils(){
    }
    
    public static void saveSuccess(HttpServletRequest request, String message){
        HttpSession session = request.getSession();
        session.setAttribute(SUCCESS_KEY, message);
    }
    
    public static void saveError(HttpServletRequest request, String message){
        HttpSession session = request.getSession();
        session.setAttribute(ERROR_KEY, message);
    }
    
    public static void saveViolations(HttpServletRequest request, Iterable<?> violations){
        HttpSession session = request.getSession();
        session.setAttribute(VIOLATION_KEY, violations);
    }
}
