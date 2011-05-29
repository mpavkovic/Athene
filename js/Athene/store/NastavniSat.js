Ext.define('Athene.store.NastavniSat', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.NastavniSat',
    proxy: {
        type: 'direct',
        directFn: NastavniSat.getAll,
        reader: {
            root: 'data'
        }
    },
    sorters: [
        {
            property: 'datum'
        }
    ]
});