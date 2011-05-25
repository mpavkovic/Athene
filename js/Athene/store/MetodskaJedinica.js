Ext.define('Athene.store.MetodskaJedinica', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.MetodskaJedinica',
    proxy: {
        type: 'direct',
        directFn: MetodskaJedinica.getAll
    },
    sorters: [
        {
            property: 'opis'
        }
    ]
});