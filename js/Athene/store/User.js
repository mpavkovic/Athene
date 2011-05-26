﻿Ext.define('Athene.store.User', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.User',
    proxy: {
        type: 'direct',
        directFn: User.getAll
    },
    sorters: [
        {
            property: 'username'
        }
    ],
    listeners: {
        load: function() {
            console.log('Loading data for User store');
        }
    }
});