class ComentariosController < ApplicationController
    def create
        @articulo = Articulo.find(params[:articulo_id])
        @comentario = @articulo.comentarios.create(comentario_params)
        redirect_to articulo_path(@articulo)
      end

    def destroy
        @articulo = Articulo.find(params[:articulo_id])
        @comentario = @articulo.comentarios.find(params[:id])
        @comentario.destroy
        redirect_to articulo_path(@articulo), status: :see_other
    end
    
      private
        def comentario_params
          params.require(:comentario).permit(:titulo, :cuerpo)
        end
end
