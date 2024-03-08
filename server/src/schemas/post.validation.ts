import { z } from 'zod';

//title, maps, section, description, details, location, multilocation, contact

export const postSchema = z.object({
    title: z.string(
        { required_error: "Titulo es requirido" }
    ),
    maps: z.string(
        { required_error: "Mapa es requirido" }
    ),
    section: z.string(
        { required_error: "Seccion es requirida" }
    ),
    description: z.string(
        { required_error: "Descripcion es requirida" }
    ),
    details: z.string(
        { required_error: "Detalles es requirido" }
    ),
    location: z.string(
        { required_error: "Ubicacion es requirida" }
    ),
    multilocation: z.boolean(
        { required_error: "Multilocation es requirido" }
    ),
    contact: z.string(
        { required_error: "Contacto es requirido" }
    ),
});



export function validatePost(data: any) { 
    return postSchema.safeParse(data);
}