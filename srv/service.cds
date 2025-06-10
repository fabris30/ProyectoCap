using { com.salesOrdes as entities } from '../db/salesorder';


service SalesOrdes {

    entity Headers as projection on entities.Headers;
    entity Items as projection on entities.Items;
    entity Status as projection on entities.Status;

}