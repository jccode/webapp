package tk.jcchen.miniweb;

import static org.junit.Assert.assertEquals;

import java.io.File;

import org.junit.Test;
import org.springframework.util.StringUtils;

public class AppTest {

	@Test
	public void testJoin() {
		String toSave = StringUtils.arrayToDelimitedString(
				new String[]{"web", "static", "upload"}, File.separator);
		assertEquals("must be the same", "web/static/upload", toSave);
	}

}
