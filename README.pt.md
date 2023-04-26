# Introdução à acessibilidade urbana: um guia prático em R

[![Quarto build](https://github.com/ipeaGIT/aop_curso/actions/workflows/publish.yml/badge.svg)](https://github.com/ipeaGIT/aop_curso/actions)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ipeaGIT/intro_access_book/HEAD?urlpath=rstudio)

Este repositório contém o código-fonte do livro [Introdução à acessibilidade urbana: um guia prático em R](https://ipeagit.github.io/intro_access_book/), escrito por [Rafael H. M. Pereira](https://www.urbandemographics.org/) e [Daniel Herszenhut](https://dhersz.netlify.app/pt/). Caso use o material deste livro, pedimos por gentileza que cite-o utilizando a seguinte referência:

> Pereira, Rafael H. M. & Herszenhut, Daniel. (2023) Introdução à acessibilidade urbana: um guia prático em R. Instituto de Pesquisa Econômica Aplicada (Ipea).

**Nota:** Este livro está em constante processo de modificação, o que signfica que seu conteúdo pode ser alterado ao longo do tempo. No entanto, esse conteúdo tem estado estável desde o começo de 2023, com apenas algumas pequenas correções e revisões gramaticais. 

## Baixando o código-fonte

A forma mais fácil de baixar o código-fonte do livro é utilizando o *software* [git](https://git-scm.com/). Depois de instalá-lo, o código pode ser baixado com o seguinte comando:

```
git clone https://github.com/ipeaGIT/intro_access_book.git
```

Alternativamente, o código pode ser baixado manualmente no *link* a seguir: <https://github.com/ipeaGIT/intro_access_book/archive/refs/heads/main.zip>. Caso este método seja utilizado, é necessário também extrair o conteúdo do arquivo ZIP baixado para uma nova pasta.

## Reproduzindo o livro localmente

Este livro foi escrito com o sistema de publicação [Quarto](https://quarto.org/). A renderização de arquivos `.qmd` em HTML/PDF/*etc* requer que o programa Quarto esteja instalado. Por favor veja as instruções de instalação deste programa [neste link](https://quarto.org/docs/get-started/).

Buscando facilitar a reprodução do livro localmente, este projeto utiliza o pacote de R [`{renv}`](https://rstudio.github.io/renv/index.html). Este pacote faz a gestão de dependências do livro, garantindo que os mesmos pacotes utilizados em seu desenvolvimento sejam utilizados na cópia a ser reproduzida em seu computador.

Para isso, primeiro abra o projeto do livro. Usuários do RStudio devem abrir o arquivo `intro_access_book.Rproj`, localizado dentro da pasta criada ao baixar o código-fonte. Usuários de outros editores de texto (neovim, VS Code, *etc*) devem iniciar a sessão do R dentro desta pasta. Você irá se deparar com mensagens similiares às seguintes:

```
# Bootstrapping renv 0.16.0 --------------------------------------------------
* Downloading renv 0.16.0 ... OK (downloaded binary)
* Installing renv 0.16.0 ... Done!
* Successfully installed and loaded renv 0.16.0.
* Project '~/repos/teste/intro_access_book' loaded. [renv 0.16.0]
* The project library is out of sync with the lockfile.
* Use `renv::restore()` to install packages recorded in the lockfile.
```

Após isso, rode o seguinte comando para instalar as dependências usadas no livro:

```r
renv::restore()
```

Neste momento, uma série de pacotes serão listados e o `{renv}` pedirá para confirmar se você deseja instalá-los. Após esta confirmação, os pacotes serão instalados.

**Nota:** Este processo pode tomar um longo tempo. A instalação de todos os pacotes, caso você nunca tenha usado o `{renv}` antes, pode levar de 5 a 30 minutos, dependendo das configurações da sua máquina.

**Nota 2:** Este livro depende do pacote `{sf}`. Caso você esteja tentando reproduzir o livro em uma distribuição do Linux, a instalação deste pacote requer a instalação de algumas dependências a nível de sistema. Por favor veja as [instruções de instalação](https://github.com/r-spatial/sf#linux) do `{sf}` para mais detalhes sobre como proceder neste caso. As dependências de sistema devem ser instaladas **antes** de rodar o comando `renv::restore()`.

Depois de instaladas as dependências do livro, seu código-fonte poderá ser executado normalmente. Os capítulos do livro estão ordenados numericamente em arquivos no formato `.qmd`. Para rodar o livro todo de uma vez, utilize um dos seguintes comandos:

```r
quarto::quarto_preview()

quarto::quarto_render()
```

**Nota:** A renderização do livro pode tomar algum tempo. Em nossa experiência, o processo como um todo pode levar de 5 a 15 minutos, dependendo das especificações do seu computador.

**Nota 2:** A renderização do livro, em particular do Capítulo 6, requer cerca de **4 GB de memória RAM**. Certifique-se de que o seu computador consiga cumprir com este requisito, caso contrário os comandos provavelmente retornarão uma mensagem de erro e o seu computador ficará muito lento.

O primeiro comando (`quarto::quarto_preview()`) renderiza os capítulo e abre o livro gerado localmente em uma aba do seu navegador. O segundo apenas renderiza os capítulos. Ao final de sua execução, os arquivos renderizados ficam salvos na pasta `_book`, criada pelos comandos.

## Reproduzindo o livro com um *binder*

Um *binder* é uma ferramenta que permite rodar códigos na nuvem através de um navegador. O código do livro pode ser rodado usando um servidor publicado pelo [mybinder](https://mybinder.org/). Para isso, clique no ícone abaixo: após alguns instantes, uma sessão do RStudio Cloud começará a rodar no seu navegador. Esta sessão inclui todos os arquivos e dados necessários para rodar o código do livro.

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ipeaGIT/intro_access_book/HEAD?urlpath=rstudio)

Por favor, note que sessões do mybinder estão limitadas a 2 GB de memória RAM. Esta restrição pode impedir que capítulos de processamento um pouco mais pesado, em particular o Capítulo 6, sejam executados adequadamente. Em caso de uso do *binder*, sugerimos que não tente renderizar o livro todo com o Quarto, como mostrado acima.

## Licença de uso

<img align="right" src="images/ipea_logo.png" width="240">
É permitida a reprodução e a exibição para uso educacional ou informativo, desde que respeitado o crédito ao autor original e citada a fonte. Permitida a inclusão da obra em Repositórios ou Portais de Acesso Aberto, desde que fique claro para os usuários os termos de uso da obra e quem é o detentor dos direitos autorais, o Instituto de Pesquisa Econômica Aplicada (Ipea). Proibido o uso comercial ou com finalidades lucrativas em qualquer hipótese. Proibida a criação de obras derivadas. Para imagens estáticas e em movimento (vídeos e audiovisuais), ATENÇÃO: os direitos de imagem foram cedidos apenas para a obra original, formato de distribuição e repositório. Esta licença está baseada em estudos sobre a Lei Brasileira de Direitos Autorais (Lei 9.610/1998).

## Agradecimentos

Este livro foi elaborado pelo Instituto de Pesquisa Econômica Aplicada (Ipea) no âmbito da parceria entre Ipea e a Secretaria de Mobilidade e Desenvolvimento Regional e Urbano (SMDRU) do Ministério do Desenvolvimento Regional (MDR). Os autores agradecem aos comentários e sugestões de Lucas Mation.
