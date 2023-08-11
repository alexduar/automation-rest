package api.app.home.buscaParcialApi;

public enum BuscaParcialApiENUM {

    NOME("servicos.nome"),
    ROTA("servicos.rota");

    private String busca;

    BuscaParcialApiENUM(String busca){ this.busca = busca; }

    public String getIndice(){
        return busca;
    }
}
