package suite;

import java.io.File;

import org.easyb.junit.EasybSuite;

/**
 * Doesn't work with the current version of easyb-junit and easyb-plugin
 * @author felipeforbeck
 *
 */
public class TestSuiteLauncher extends EasybSuite {

	@Override
	protected File baseDir() {
		return new File("src/test/groovy/suite/story");
	}

	@Override
	protected String description() {
		return "Easyb Test Suite";
	}

	@Override
	protected boolean trackTime() {
		return true;
	}
}