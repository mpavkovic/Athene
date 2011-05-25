﻿Ext.define('Athene.store.Adresa', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Adresa',
    proxy: {
        type: 'direct',
        directFn: Adresa.getAll
    },
    sorters: [
        {
            property: 'ucenik_id'
        }
    ]
});