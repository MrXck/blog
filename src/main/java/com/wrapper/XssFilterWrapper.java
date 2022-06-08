package com.wrapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import org.springframework.web.util.HtmlUtils;

public class XssFilterWrapper  extends HttpServletRequestWrapper {


    public XssFilterWrapper(HttpServletRequest request) {
        super(request);
    }

    @Override
    public String getHeader(String name) {
        if (super.getHeader(name) != null){
            return HtmlUtils.htmlEscape(super.getHeader(name));
        }
        return super.getHeader(name);
    }

    @Override
    public String getQueryString() {
        if (super.getQueryString() != null){
            return HtmlUtils.htmlEscape(super.getQueryString());
        }
        return super.getQueryString();
    }

    @Override
    public String getParameter(String name) {
        if (super.getParameter(name) != null){
            return HtmlUtils.htmlEscape(super.getParameter(name));
        }
        return super.getParameter(name);
    }

    @Override
    public String[] getParameterValues(String name) {
        String[] values = super.getParameterValues(name);
        if(values != null) {
            int length = values.length;
            String[] escapseValues = new String[length];
            for(int i = 0; i < length; i++){
                escapseValues[i] = HtmlUtils.htmlEscape(values[i]);
            }
            return escapseValues;
        }
        return super.getParameterValues(name);
    }

}
