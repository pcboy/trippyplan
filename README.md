[![Build Status](https://travis-ci.org/pcboy/trippyplan.svg?branch=master)](https://travis-ci.org/pcboy/trippyplan)

# Trippyplan

Trippy plan helps you to plan your next trip by grouping attractions close to each other.

## Installation

    $ gem install trippyplan

## Usage

### TSV file support
Give a file `trips.tsv` following that format:
```
Memorial des Martyrs de la Deportation <tab> Square de l'Ile de France, 75004 Paris France
Parc de Bercy <tab> Quay de Bercy, 75012 Paris France
Aquarium Tropical de la Porte Doree <tab> 293 avenue Daumesnil, 75012 Paris France
Musee d'Art et d'Histoire du Judaisme <tab> 71 rue du Temple Hôtel de Saint-Aignan, 75003 Paris France
Bercy Village <tab> Cour Saint-Emilion 28 rue François Truffaut, 75012 Paris France
```

You can use trippyplan like this:
```
$> trippyplan --tsv trips.tsv -d 3
Day 1:
        Aquarium Tropical de la Porte Doree
Day 2:
        Parc de Bercy
        Bercy Village Cour Saint-Emilion
Day 3:
        Memorial des Martyrs de la Deportation
        Musee d'Art et d'Histoire du Judaisme
```

### Trip advisor saved trips support
trippyplan can directly fetch a list of places you saved for your trip already.
What you need to gives me is your cookie though.
To get that cookie:
- simply activate the developer tools in your browser (i.e right click, inspect) and go to the network tab and the XHR filter.
- go to your trip advisor saved trip url (should look something like https://www.tripadvisor.com/Saves/57292478)
- On the list of calls on the right find the one with just a number (in my case 57292478) and click on it
- You should now have on the right the request headers.
- What you need is the `X-Requested-By` value and the `Cookie` value. Create a file `cookie.yaml` and paste these values following that format:  
```
js_security_token: 'TNI1635!AO6YTYtm5C46HxKNQ8HdixmF7xMnk+SrVIEjyROUSajGaSHSrH0h/bjbR1qCEEifYhuOTktGYB29yWuy3Qsr8Gd/1MN4NN4MQTRSmFYsb4APQEsu6A2gNtX7nytOB8RSoBgBSz5FqoUNxjXU90eTq9i+zAqeX/EsgmJdPNn1gy/U'
cookie: 'TAUnique=%1%enc%3A%2FhBZMXFzVlmxR%2FK32EAYhU2jwwE8%2FgjJoTfLQq1%2BeLPqbL7B36alrg%3D%3D; ServerPool=A; TASSK=enc%3AAOkqsILPd%2F6vwdO2FBmMAlIPTLzn8ool0U1GN2xIChUD6Qko6gL5J%2Bdj%2FLCcYdVKPpY3r8EXNKVh8ltkWEwGBgsOBzcSPpcfe[...]'
```

That's all. Now you can simply run trippyplan with the trip advisor option.
See example here with my 12 days trip to Paris:
```
$> trippyplan -t https://www.tripadvisor.com/Saves/57292478 -r cookie.yaml -d 12
Day 1:
        Aquarium Tropical de la Porte Doree
Day 2:
        Le Jardin de Versailles
        The Hall of Mirrors
        Chateau de Versailles
        L'Orangerie
Day 3:
        Arc de Triomphe
        Eiffel Tower
Day 4:
        Latin Quarter
        Saint Germain des Pres Quarter
        Sainte-Chapelle
        Musee du Louvre
        Luxembourg Gardens
Day 5:
        Montparnasse
        Le Bon Marche Rive Gauche
        The Catacombs
Day 6:
        Centre Pompidou
        Memorial de la Shoah (Shoah Memorial)
        Musee d'Art et d'Histoire du Judaisme
        Notre Dame Cathedral
        Ile de la Cite
        Memorial des Martyrs de la Deportation
        Le Marais
        Ile Saint-Louis
        Les Halles
        Rue Montorgueil
Day 7:
        Bercy Village
        Parc de Bercy
Day 8:
        Le Quartier de la Butte Aux Cailles a Paris
Day 9:
        Basilica du Sacre-Coeur de Montmartre
        Montmartre
Day 10:
        Jardin des Tuileries
        Place de la Concorde
        Musee de l'Orangerie
        Musee d'Orsay
        Galeries Lafayette
Day 11:
        Grand Palais
        Champs-Elysees
        Grands Boulevards
        Rue du Faubourg Saint-Honore
Day 12:
        Bastille Market
        Place des Vosges
        Place de la Bastille
        Place de la Republique
        Canal Saint-Martin
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pcboy/trippyplan. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

