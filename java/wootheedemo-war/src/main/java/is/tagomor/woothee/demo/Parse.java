package is.tagomor.woothee.demo;

import java.io.IOException;
import java.util.Properties;

import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import is.tagomor.woothee.Classifier;

public class Parse extends HttpServlet {
  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws IOException {
    String ua = req.getParameter("ua");
    if (ua == null)
      ua = req.getHeader("User-Agent");

    Map r = Classifier.parse(ua);

    resp.setHeader("Access-Control-Allow-Origin", "*");
    resp.setContentType("application/json");

    ObjectMapper mapper = new ObjectMapper();
    resp.getWriter().print(mapper.writeValueAsString(r));
  }
}
