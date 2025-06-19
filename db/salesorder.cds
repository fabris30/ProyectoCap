namespace com.salesOrdes;

using {
    sap.common.CodeList,
    sap.common.Currencies,
    sap.common.Countries
} from '@sap/cds/common';

entity Headers {
    key ID           : String(36);
        email        : String(30);
        firstname    : String(30);
        lastname     : String(30);
        country      : Association to Countries;
        createon     : Date;
        deliverydate : Date;
        orderstatus  : Association to Status;
        imagenUrl    : String(255);
        toItems      : Composition of many Items
                           on toItems.headers = $self;
}

entity Items {

    key ID               : String(36);
        name             : String(40);
        description      : String(40);
        releasedate      : Date;
        discontinueddate : Date;
        price            : Decimal(12, 2);
        currency         : Association to Currencies;
        height           : Decimal(15, 3);
        width            : Decimal(13, 2);
        depth            : Decimal(12, 2);
        quantity         : Decimal(16, 2);
        unitofmeasure    : String(3) default 'CM';
    key headers          : Association to Headers;

}

entity Status : CodeList {
    key code        : String(10) enum {

            Canceled = 'Canceled';
            InProcess = 'In Process';
            Delivered = 'Delivered';
        };
        criticality : Integer;

}
