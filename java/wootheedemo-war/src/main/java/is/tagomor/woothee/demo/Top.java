package is.tagomor.woothee.demo;

import java.io.IOException;
import java.util.Properties;

import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import is.tagomor.woothee.Classifier;

public class Top extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws IOException {
        resp.getWriter.print("ok");
    }
}
