
import 'package:flutter/services.dart';
import 'package:realm_of_patternia/components/actors/player/golem.dart';
import 'package:realm_of_patternia/components/actors/player/quest_builders.dart';
import 'package:realm_of_patternia/components/items/orbs.dart';
double startime=0;
bool isFS=false;
List<Quest_Builders> FactoryQB=[];
List<Quest_Builders> ObserverQB=[];
List<Quest_Builders> AdapterQB=[];
List<Quest_Builders> ChainQB=[];
List<Quest_Builders> FacadeQB=[];
List<Quest_Builders> SingletonQB=[];
List<Orbs>orbs=[];
List<Golem>golems=[];

//fixing functions
VoidCallback FGF=() {};
VoidCallback FLM=() {};
VoidCallback FML=() {};
VoidCallback FTO=() {};
List<VoidCallback> FMNT=[];

Stopwatch GameSW = Stopwatch();
Stopwatch FactorySW = Stopwatch();
Stopwatch SingletonSW = Stopwatch();
Stopwatch ObserverSW = Stopwatch();
Stopwatch AdapterSW = Stopwatch();
Stopwatch ChainSW = Stopwatch();
Stopwatch FacadeSW = Stopwatch();

List<String> start_diagram_audio =['voice_lines/golem_factory_audio_2.mp3','voice_lines/tax_office_audio_2.mp3','voice_lines/news_tower_audio_2.mp3','voice_lines/weather_tower_audio_2.mp3','voice_lines/sawmill_audio_2.mp3','voice_lines/magical_library_audio_2.mp3'];
List<String> pats =['Factory', 'Singleton', 'Observer', 'Adapter', 'Chain of Responsibility', 'Facade',];
List<String> spats =['Overall','Factory', 'Singleton', 'Observer', 'Adapter', 'Chain of Responsibility', 'Facade', ];

List<bool> completed_pats=[false, false, false, false, false, false, ];
int num_comp_pats = 0;
VoidCallback close_function=() {};

List <String>load_audio= ['pattern_components/singleton.mp3','pattern_components/observer.mp3','pattern_components/factory.mp3','pattern_components/facade.mp3','pattern_components/chain.mp3','pattern_components/adapter.mp3','voice_lines/tax_office_audio_1.mp3','voice_lines/golem_factory_audio_1.mp3','voice_lines/news_tower_audio_1.mp3','voice_lines/weather_tower_audio_1.mp3','voice_lines/sawmill_audio_1.mp3','voice_lines/magical_library_audio_1.mp3']+fact_comp_audio+faca_comp_audio+sing_comp_audio+obse_comp_audio+adap_comp_audio+chai_comp_audio+start_diagram_audio;
int fac_comps_num = 0;
List<bool> factoryComps=[false,false,false,false];
List<bool> factoryCompsTask=[false,false,false,false];
List<String> fact_strcut = ['Product', 'Concrete Products', 'Creator', 'Concrete Creators']; 
List<String> fact_comp_imgs=['assets/images/Pattern_Components/factory_1.png',
'assets/images/Pattern_Components/factory_2.png',
'assets/images/Pattern_Components/factory_3.png',
'assets/images/Pattern_Components/factory_4.png'];
List<String> fact_comp_audio=['pattern_components/factory_1.mp3',
'pattern_components/factory_2.mp3',
'pattern_components/factory_3.mp3',
'pattern_components/factory_4.mp3'];
List<String> fact_comp_details=['The Product declares the interface, which is common to all objects that can be produced by the creator and its subclasses.',
'Concrete Products are different implementations of the product interface.',
'The Creator class declares the factory method that returns new product objects. It’s important that the return type of this method matches the product interface. \n\nYou can declare the factory method as abstract to force all subclasses to implement their own versions of the method. As an alternative, the base factory method can return some default product type.\n\nNote, despite its name, product creation is not the primary responsibility of the creator. Usually, the creator class already has some core business logic related to products. The factory method helps to decouple this logic from the concrete product classes. Here is an analogy: a large software development company can have a training department for programmers. However, the primary function of the company as a whole is still writing code, not producing programmers.',
'Concrete Creators override the base factory method so it returns a different type of product.\n\nNote that the factory method doesn’t have to create new instances all the time. It can also return existing objects from a cache, an object pool, or another source.'];

int sing_comps_num = 0;
List<bool> SingletonComps=[false,false];
List<bool> SingletonCompsTask=[false,false];
List<String> sing_strcut = ['Singleton', 'Client'];
List<String> sing_comp_imgs=['assets/images/Pattern_Components/singleton_1.png',
'assets/images/Pattern_Components/singleton_2.png'];
List<String> sing_comp_audio=['pattern_components/singleton_1.mp3',
'pattern_components/singleton_2.mp3'];
List<String> sing_comp_details=['The Singleton class declares the static method getInstance that returns the same instance of its own class.\n\nThe Singleton’s constructor should be hidden from the client code. Calling the get Instance method should be the only way of getting the Singleton object.',
'The Client gets information from the instance of the Singleton Class.'];

int obs_comps_num = 0;
List<bool> ObserverComps=[false,false,false,false];
List<bool> ObserverCompsTask=[false,false,false,false];
List<String> obse_strcut = ['Publisher', 'Subscriber', 'Concrete Subscriber', 'Client']; 
List<String> obse_comp_imgs=['assets/images/Pattern_Components/observer_1.png',
'assets/images/Pattern_Components/observer_2.png',
'assets/images/Pattern_Components/observer_3.png',
'assets/images/Pattern_Components/observer_4.png'];
List<String> obse_comp_audio=['pattern_components/observer_1.mp3',
'pattern_components/observer_2.mp3',
'pattern_components/observer_3.mp3',
'pattern_components/observer_4.mp3'];
List<String> obse_comp_details=['The Publisher issues events of interest to other objects. These events occur when the publisher changes its state or executes some behaviors. Publishers contain a subscription infrastructure that lets new subscribers join and current subscribers leave the list.\n\nWhen a new event happens, the publisher goes over the subscription list and calls the notification method declared in the subscriber interface on each subscriber object.',
'The Subscriber interface declares the notification interface. In most cases, it consists of a single update method. The method may have several parameters that let the publisher pass some event details along with the update.',
'Concrete Subscribers perform some actions in response to notifications issued by the publisher. All of these classes must implement the same interface so the publisher isn’t coupled to concrete classes. \n\nUsually, subscribers need some contextual information to handle the update correctly. For this reason, publishers often pass some context data as arguments of the notification method. The publisher can pass itself as an argument, letting subscriber fetch any required data directly.',
'The Client creates publisher and subscriber objects separately and then registers subscribers for publisher updates.'];

int adap_comps_num = 0;
List<bool> AdapterComps = [false,false,false,false];
List<bool> AdapterCompsTask = [false,false,false,false];
List<String> adap_strcut = ['Client', 'Client Interface', 'Service', 'Adapter']; 
List<String> adap_comp_imgs=['assets/images/Pattern_Components/adapter_1.png',
'assets/images/Pattern_Components/adapter_2.png',
'assets/images/Pattern_Components/adapter_3.png',
'assets/images/Pattern_Components/adapter_4.png'];
List<String> adap_comp_audio=['pattern_components/adapter_1.mp3',
                              'pattern_components/adapter_2.mp3',
'pattern_components/adapter_3.mp3',
'pattern_components/adapter_4.mp3'];
List<String> adap_comp_details=['The Client is a class that contains the existing business logic of the program.\n\n The client code doesn’t get coupled to the concrete adapter class as long as it works with the adapter via the client interface. Thanks to this, you can introduce new types of adapters into the program without breaking the existing client code. This can be useful when the interface of the service class gets changed or replaced: you can just create a new adapter class without changing the client code.',
'The Client Interface describes a protocol that other classes must follow to be able to collaborate with the client code.',
'The Service is some useful class (usually 3rd-party or legacy). The client can’t use this class directly because it has an incompatible interface.',
'The Adapter is a class that’s able to work with both the client and the service: it implements the client interface, while wrapping the service object. The adapter receives calls from the client via the client interface and translates them into calls to the wrapped service object in a format it can understand.'];

int chain_comps_num = 0;
List<bool> ChainComps = [false,false,false,false];
List<bool> ChainCompsTask = [false,false,false,false];
List<String> chai_strcut = ['Handler', 'Base Handler', 'Concrete Handlers', 'Client']; 
List<String> chai_comp_imgs=['assets/images/Pattern_Components/chain_1.png',
'assets/images/Pattern_Components/chain_2.png',
'assets/images/Pattern_Components/chain_3.png',
'assets/images/Pattern_Components/chain_4.png'];
List<String> chai_comp_audio=['pattern_components/chain_1.mp3',
'pattern_components/chain_2.mp3',
'pattern_components/chain_3.mp3',
'pattern_components/chain_4.mp3'];
List<String> chai_comp_details=['The Handler declares the interface, common for all concrete handlers. It usually contains just a single method for handling requests, but sometimes it may also have another method for setting the next handler on the chain.',
'The Base Handler is an optional class where you can put the boilerplate code that’s common to all handler classes.\n\nUsually, this class defines a field for storing a reference to the next handler. The clients can build a chain by passing a handler to the constructor or setter of the previous handler. The class may also implement the default handling behavior: it can pass execution to the next handler after checking for its existence.',
'Concrete Handlers contain the actual code for processing requests. Upon receiving a request, each handler must decide whether to process it and, additionally, whether to pass it along the chain.\n\nHandlers are usually self-contained and immutable, accepting all necessary data just once via the constructor.',
'The Client may compose chains just once or compose them dynamically, depending on the application’s logic. Note that a request can be sent to any handler in the chain—it doesn’t have to be the first one.'];

int faca_comps_num = 0;
List<bool> FacadeComps = [false,false,false,false];
List<bool> FacadeCompsTask = [false,false,false,false];
List<String> faca_strcut = ['Facade', 'Additional Facade', 'Subsystem Class', 'Client']; 
List<String> faca_comp_imgs=['assets/images/Pattern_Components/facade_1.png',
'assets/images/Pattern_Components/facade_2.png',
'assets/images/Pattern_Components/facade_3.png',
'assets/images/Pattern_Components/facade_4.png'];
List<String> faca_comp_audio=['pattern_components/facade_1.mp3',
'pattern_components/facade_2.mp3',
'pattern_components/facade_3.mp3',
'pattern_components/facade_4.mp3'];
List<String> faca_comp_details=['The Facade provides convenient access to a particular part of the subsystem’s functionality. It knows where to direct the client’s request and how to operate all the moving parts.',
'An Additional Facade class can be created to prevent polluting a single facade with unrelated features that might make it yet another complex structure. Additional facades can be used by both clients and other facades.',
'The Complex Subsystem consists of dozens of various objects. To make them all do something meaningful, you have to dive deep into the subsystem’s implementation details, such as initializing objects in the correct order and supplying them with data in the proper format.\n\nSubsystem classes aren’t aware of the facade’s existence. They operate within the system and work with each other directly.',
'The Client uses the facade instead of calling the subsystem objects directly.'];
