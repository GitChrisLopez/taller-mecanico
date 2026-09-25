import { Cliente } from './entidades.js';
import { CrearClienteDto } from '../dto/crear-cliente.dto.js';
export interface ClienteRepository {
    listar(): Promise<Cliente[]>;
    buscarPorId(id: number): Promise<Cliente | null>;
    crear(datos: CrearClienteDto): Promise<Cliente>;
    actualizar(id: number, datos: Cliente): Promise<Cliente | null>;
    eliminar(id: number): Promise<Cliente | null>;
}
