import { Router } from 'express'
import Cover from '../libs/Cover';
import { create, get, star } from '../controllers/post.controller';
const router =  Router();



router.post('/', Cover, create);
router.put('/', star);
router.get('/', get)



export default router;


