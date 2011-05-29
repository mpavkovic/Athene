Ext.define('Athene.store.NastavnaJedinica', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.NastavnaJedinica',
    proxy: {
        type: 'direct',
        directFn: NastavnaJedinica.getAll,
        reader: {
            root: 'data'
        }
    },
    sorters: [
        {
            property: 'opis'
        }
    ]
});