package story

import java.util.concurrent.TimeUnit

import org.openqa.selenium.By
import org.openqa.selenium.firefox.FirefoxDriver


description "Pesquisando no google"

narrative "Pesquisando no google a palavra 'Groovy'", {
	as_a "Usuário"
	i_want "Encontrar no google o link para o site oficial da linguagem de programação Groovy."
	so_that "Após encontrar o link poderei consultar a página para mais informações."
}

before "Abrir navegador firefox", {
	driver = new FirefoxDriver()
	driver.manage().timeouts().implicitlyWait(6, TimeUnit.SECONDS)
}

scenario "Acessar o google e pesquisar pela palavra groovy", {

	given "Usuario acessa a página do google", { driver.get("http://www.google.com") }

	when "Digita a palavra groovy", {
		queryField = driver.findElement(By.name("q"))
		queryField.sendKeys("groovy")
	}

	and "Clica no botão pesquisar", { queryField.submit() }

	then "O título da página de resultados deve conter a palavra digitada", {
		def divResultado = driver.findElement(By.id("ires"))
		ensure(divResultado.getText()) { contains "Groovy - Home" }
	}
}

scenario "2 - Pendente"

scenario "3 - Pendente", {
	given "algo"
	when "alguma coisa acontecer"
	then "validar o resultado"
}

after "Fechar a página", {
	then "A página está fechada", { driver.close() }
}