package page;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class GoogleSearchPage {

	private WebDriver driver;

	@FindBy(name = "q")
	private WebElement searchField;

	@FindBy(name = "btnG")
	private WebElement searchButton;

	@FindBy(id = "ires")
	private WebElement divResult;

	public GoogleSearchPage(WebDriver driver) {
		this.driver = driver;
	}

	public void open(String url) {
		driver.get(url);
	}

	public void close() {
		driver.close();
	}

	public String getTitle() {
		return driver.getTitle();
	}

	public void type(String searchTerm) {
		searchField.sendKeys(searchTerm);
	}

	public void clickOnSearchButton() {
		searchButton.click();
	}

	public String getResult() {
		return divResult.getText();
	}

}