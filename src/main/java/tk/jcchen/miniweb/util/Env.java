package tk.jcchen.miniweb.util;

import org.springframework.web.context.ContextLoader;

public class Env {

	public final static String WEBROOT = ContextLoader
			.getCurrentWebApplicationContext().getServletContext()
			.getRealPath("/");
}
