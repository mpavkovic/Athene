﻿Ext.define('Athene.store.Zanimanje', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Zanimanje',
    proxy: {
        type: 'direct',
        directFn: Zanimanja.getAll
    },
    sorters: [
        {
            property: 'naziv'
        }
    ]
});