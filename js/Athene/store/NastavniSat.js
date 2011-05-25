Ext.define('Athene.store.NastavniSat', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.NastavniSat',
    proxy: {
        type: 'direct',
        directFn: NastavniSat.getAll
    },
    sorters: [
        {
            property: 'datum'
        }
    ]
});