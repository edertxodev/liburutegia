module SolicitudesHelper
    def num_solicitudes_pendientes
        Solicituds.where(aceptado: false).count
    end
    
    def num_solicitudes_hechas
        Solicituds.where(user_id: current_user.id).count
    end
end
