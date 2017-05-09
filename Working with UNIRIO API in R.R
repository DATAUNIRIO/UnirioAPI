#install.packages(c("httr", "jsonlite", "lubridate"))
library(httr)
library(jsonlite)

## Please note that you must replace the key below (“sample_key”) with your own key for this script to work
## You can get your own key directly from DTIC here (http://sistemas.unirio.br)
## UNIRIO sample API
##########################################################################################
#[Views] V_SERVIDORES_DADOS V_EMW_DISCIPLINAS V_EMW_CURSOS V_EMW_DOCENTES V_ALUNOS_ATIVOS
##########################################################################################
sample  <- GET("http://sistemas.unirio.br/api_teste/ALUNOS?API_KEY=pedirachavedoAPIparaoDTIC")
sample2 <- GET("http://sistemas.unirio.br/api_teste/V_ALUNOS_ATIVOS?API_KEY=pedirachavedoAPIparaoDTIC")
sample2 <- GET("http://sistemas.unirio.br/api_teste/V_SERVIDORES_DADOS?API_KEY=pedirachavedoAPIparaoDTIC")
content(sample)
content(sample2)

result <- content(sample)
result2 <- content(sample2)

# API run tests
result$content[[99]]$dt_nascimento
result$content[[99]]$sexo

result2$content[[78]]$curso
result2$content[[98]]$tipo_de_aluno
result2$content[[97]]$datanascimento
result2$content[[97]]$periodo

##################################
#######     ALUNOS        ######## 
##################################

# Dataset Building
dadosalunos<-"data"
  for (i in 1:100) {  
    result$content[[i]]$dt_nascimento
    dadosalunos<<-rbind(dadosalunos,result$content[[i]]$dt_nascimento)
    }
  dadosalunos2<-"sexo"
  for (i in 1:100) {  
    result$content[[i]]$sexo
    dadosalunos2<<-rbind(dadosalunos2,result$content[[i]]$sexo)
  }
  # Merge  
  dadosalunosfinal<-data.frame(dadosalunos,dadosalunos2)
  dadosalunosfinal<-dadosalunosfinal[-1,]
  # Change the column names
  colnames(dadosalunosfinal)<-c("datanascimento","sexo")
  # Show the data
  head(dadosalunosfinal)
  dim(dadosalunosfinal)
  table(dadosalunosfinal$sexo)

##################################
#######  V_ALUNOS_ATIVOS  ######## 
##################################
  dadosalunosativos<-" "
  for (i in 1:100) {  
    result2$content[[i]]$curso
    dadosalunosativos<<-rbind(dadosalunosativos,result2$content[[i]]$curso)
  }
  dadosalunosativos2<-" "
  for (i in 1:100) {  
    result2$content[[i]]$tipo_de_aluno
    dadosalunosativos2<<-rbind(dadosalunosativos2,result2$content[[i]]$tipo_de_aluno)
  }
  dadosalunosativos3<-" "
  for (i in 1:100) {  
    result2$content[[i]]$datanascimento
    dadosalunosativos3<<-rbind(dadosalunosativos3,result2$content[[i]]$datanascimento)
  }  
  dadosalunosativos4<-" "
  for (i in 1:100) {  
    result2$content[[i]]$periodo
    dadosalunosativos4<<-rbind(dadosalunosativos4,result2$content[[i]]$periodo)
  }  
  # Merge  
  dadosalunosfinal<-data.frame(dadosalunos,dadosalunos2,dadosalunos3,dadosalunos4)
  dadosalunosfinal<-dadosalunosfinal[-1,]
  
  # Change the column names
  colnames(dadosalunosfinal)<-c("curso","tipo_de_aluno","datanascimento","periodo")
  
  # Show the data
  head(dadosalunosfinal)
  dim(dadosalunosfinal)
  table(dadosalunosfinal$curso)
  edit(dadosalunosfinal)
  