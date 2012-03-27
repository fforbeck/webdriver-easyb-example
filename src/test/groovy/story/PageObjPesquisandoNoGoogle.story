package story

import java.util.concurrent.TimeUnit

import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.support.PageFactory

import page.GoogleSearchPage

description "Pesquisando no google"

narrative "Pesquisando no google a palavra 'Groovy'", {
	as_a "Usuário"
	i_want "Encontrar no google o link para o site oficial da linguagem de programação Groovy."
	so_that "Após encontrar o link poderei consultar a página para mais informações."
}

def GoogleSearchPage googleSearchPage

before "Abrir navegador firefox", {
	given "Firefox está aberto",{
		driver = new FirefoxDriver()
		driver.manage().timeouts().implicitlyWait(6, TimeUnit.SECONDS)
		googleSearchPage = PageFactory.initElements(driver, GoogleSearchPage.class)
	}
}

scenario "Acessar o google e pesquisar pela palavra groovy", {

	given "Usuario acessa a página do google", { googleSearchPage.open("http://www.google.com") }

	when "Digita a palavra groovy", { googleSearchPage.type("groovy") }

	and "Clica no botão pesquisar", { googleSearchPage.clickOnSearchButton() }

	then "O resultados deve conter a palavra digitada", {
		ensure(googleSearchPage.result) { contains "groovy" }
	}
}

scenario "2 - Pendente"

scenario "3 - Pendente", {
	given "algo"
	when "alguma coisa acontecer"
	then "validar o resultado"
}

after "Fechar a página", {
	then "A página está fechada", { googleSearchPage.close() }
}