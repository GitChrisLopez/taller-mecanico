FrontEnd

Alumnos:
Chris Fitch Lopez (Parte A)
Maria Jose Enriquez Lara (Parte B)

IDs:
252379
252337 

Tarea – Mapeo de dominios a Prisma

Responder, (A): 
¿Qué pasaría si intentaras borrar un Cliente que todavía tiene un Vehiculo?
Se bloquearia la operacion y daria error de restriccion de llave foranea, ya que por defecto es obligatorio que el registro padre (en este caso, es el Cliente) exista MIENTRAS tenga a sus hijos (Vehiculos) vinculados
Si de verdad uno quiere borrarlos, debe eliminar primero todos los hijos (osea, los vehiculos asociados), o configurar el esquema de Prisma un "onDelete: Cascade" que hara que al borrar Cliente por defecto se borre en "cascada" todo lo relacionado a este.
