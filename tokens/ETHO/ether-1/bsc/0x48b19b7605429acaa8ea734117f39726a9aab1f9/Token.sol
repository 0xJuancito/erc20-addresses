pragma solidity ^0.8.0;

contract Token {
    string public name = "Wrapped ETHO";
    string public symbol = "ETHO";
    uint8 public decimals = 18;
    uint256 public totalSupply = 0;

    address public owner;
    modifier restricted {
        require(msg.sender == owner, "This function is restricted to owner");
        _;
    }
    modifier issuerOnly {
        require(isIssuer[msg.sender], "You do not have issuer rights");
        _;
    }

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    mapping(address => bool) public isIssuer;

	event InitialCoindrop();
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event IssuerRights(address indexed issuer, bool value);
    event TransferOwnership(
        address indexed previousOwner,
        address indexed newOwner
    );

    function getOwner() public view returns (address) {
        return owner;
    }

    function mint(address _to, uint256 _amount)
        public
        issuerOnly
        returns (bool success)
    {
        totalSupply += _amount;
        balanceOf[_to] += _amount;
        emit Transfer(address(0), _to, _amount);
        return true;
    }

    function burn(uint256 _amount) public returns (bool success) {
        totalSupply -= _amount;
        balanceOf[msg.sender] -= _amount;
        emit Transfer(msg.sender, address(0), _amount);
        return true;
    }

    function burnFrom(address _from, uint256 _amount)
        public
        issuerOnly
        returns (bool success)
    {
        balanceOf[_from] -= _amount;
        totalSupply -= _amount;
        emit Transfer(_from, address(0), _amount);
        return true;
    }

    function approve(address _spender, uint256 _amount)
        public
        returns (bool success)
    {
        allowance[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }

    function transfer(address _to, uint256 _amount)
        public
        returns (bool success)
    {
        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _amount
    ) public returns (bool success) {
        allowance[_from][msg.sender] -= _amount;
        balanceOf[_from] -= _amount;
        balanceOf[_to] += _amount;
        emit Transfer(_from, _to, _amount);
        return true;
    }

    function transferOwnership(address _newOwner) public restricted {
        require(_newOwner != address(0), "Invalid address: should not be 0x0");
        emit TransferOwnership(owner, _newOwner);
        owner = _newOwner;
    }

    function setIssuerRights(address _issuer, bool _value) public restricted {
        isIssuer[_issuer] = _value;
        emit IssuerRights(_issuer, _value);
    }
	
	function initialCoindrop() private {
		mint(0x017cC5fc6148645a1DF63C11a5e55f1830054ba4,1579847907500000018432);
		mint(0x09243587112De7251d84A0b4Eb959Fe8C008F135,350999256100000038912);
		mint(0x09f7944bc006dafb6e6Bb390696324F2b7f7fe07,386098327700000014336);
		mint(0x0C8451Cc04C9D61CEb46b9e84f309371801d4a88,1737650750600000045056);
		mint(0x0cC201cede119C304a8810Ea1dDff11580377670,831327582699999985664);
		mint(0x0D2f1a4ACD7dA2097023a7a746C71f3Decb4F56E,512663555399999946752);
		mint(0x0E71C42dA7f6f2B45BF68FC13DAeCDdCF8A5A7F7,1866224427000000151552);
		mint(0x0FfeE9E734E5e029Ab53AB5e098D17E54883a530,1888220000000000131072);
		mint(0x10385CA5490CbD440eD3Cf1802Cad810cdF04a13,5765057076299999215616);
		mint(0x11111115Aa2B3f0e93d281a01E61f1AFAC311111,5534614210099999145984);
		mint(0x13E6004CF6F26f201E7482E11AFD72Ec97Fc0cEd,3429657583400000159744);
		mint(0x154a9Fd4fe993F80F5E38bB53834e9dD384EF7B6,10581095544299999723520);
		mint(0x17A2b896D9033fC84FD2327b191452f913F103D5,768369392199999946752);
		mint(0x183f6c7A35A52b73a1527DcfEdBb97C514A9F9A9,7375940255800000249856);
		mint(0x1a6f6e5dFEFa50380541F805238C5C62206d8EBe,380000000000000000000);
		mint(0x1a92b996cD15D9eCf5711B7408Bb44F2f65b1e38,12014615309200000024576);
		mint(0x1f755E2B8dBC6a1fA8B5882C7bce5eF4ccbAce95,497824032400000024576);
		mint(0x1F83388880Aa1FD1f2Db28830e05B8E10DEB93c7,28307453137299997458432);
		mint(0x216159481ce4ab15E7D291e606b1b84BF07bc023,12147209157200001892352);
		mint(0x2202b5C6fA07fb36E36B9998Be322c0C5D71b5EE,4095742521699999940608);
		mint(0x2355A516CB80235bc1372D8B6BDaFd814c9CeD52,316843000000000032768);
		mint(0x23dcFBf951d14B1CD4694B8F20ae673f1328000b,251273080000000000000);
		mint(0x23E4eB07373D826D6c05CD5C4Bc5E4a0888dE538,269825623699999981568);
		mint(0x26b41d35790c92C382DAFbc37361927169C9B36f,2208377673600000065536);
		mint(0x2872370bf607a1488EBD1fc078aE4Da74F405e93,3453000860999999815680);
		mint(0x2883648ec5cf06DC6a205a68479677d37C0f7449,1500000000000000000000);
		mint(0x29648660e496b130b8628eA8928f9F42274d7aA7,5000767965000000077824);
		mint(0x2A015cD56DeAAec48aA0Ee8cc8ee0239bd9d6c19,404176271000000004096);
		mint(0x2D51736EAF2f20A5849BFc097127F8fCF6eC0ec2,340297813799999963136);
		mint(0x2dD66Bb2D217e002e51b891Dae06cdB886690e2b,306589624199999979520);
		mint(0x2df58f84731F5868db2581bE6281a20C35d30FB5,1437932676299999936512);
		mint(0x2f0E6242E797CDE33A719e875aAc09B52E3E0048,900000000000000000000);
		mint(0x2fc9896cB056Cd3F28716Ada06e509a1C8fED40f,11313763239299999858688);
		mint(0x30524c5F57519117f5E6F66651056C37ab4082e8,5674962708299999346688);
		mint(0x3175Cf24Ae65022cE0763e515c4743E5ff6F674e,509230923000000020480);
		mint(0x31B50D2a3d9F1A58584549aE44c5D65c732532fD,725788287799999987712);
		mint(0x31fAB13e5b28b1219f83BD846D2B452eaaddb988,500000018500000022528);
		mint(0x33B038Cd77f3B0E46e064A5cc54a6086b32AD269,3160911453100000149504);
		mint(0x348879f5A6d7e20f1aB9BfE03EA57487eEe9acA7,2031817214600000045056);
		mint(0x35a9EBb35351Bb5f31a3B04fed85C2661Bda3228,1793197172400000073728);
		mint(0x361aFF8d47E6086EA2fcFaEEC1848bB9f39d625A,307501128499999997952);
		mint(0x370C386c623Ad19a7b2e5088D86d6D8b95aeaB43,664307632999999995904);
		mint(0x37516894CA19892Aca066578CC1C3fe8E7D094B9,300000000000000000000);
		mint(0x3786a15e99608268210A895E2D0B77668fbfB008,12053399662399999442944);
		mint(0x37DD4E5111c436147B1FF6821983BCf81fb23352,936000000000000000000);
		mint(0x394BE498B532A042ba4F8dbcf6e52f016352a147,1454676451600000090112);
		mint(0x39Dd22Cd24BCB1b5Ab46686cF74F9C97e814e61c,13718605025099999346688);
		mint(0x3CeF630CE60Bfc03DA5De9B8A31AFeBf68996fe0,313494386099999997952);
		mint(0x41dE6Fc3444BAc8676fF58C90dDeA260B5bb1C07,3494101429500000075776);
		mint(0x424645034A017eeed796539E985BF7e449893A36,2167218435999999983616);
		mint(0x42C82Bf0EBDFad6EA76DB68d5E70809DA6347D69,294186006599999979520);
		mint(0x45209e49F55dfFCef6e512E269A149b8213b4FCd,784421164699999928320);
		mint(0x45b876A33F6085087c0200F4E7a27f099F76660D,3938022707400000143360);
		mint(0x47f5C6797EA64868968d9cFB50c9D270D7167b12,636472975699999981568);
		mint(0x480679e0526102dE6E55F498BBaD0531b0Cc0339,290371593099999969280);
		mint(0x49055b7C0499B5eD96F388c90e809B38eA324Ae4,7324144785100000722944);
		mint(0x4a75eE66A0BC14b480E7507c2413a768C41140fd,317836980700000026624);
		mint(0x4B898f5E32350EbE6E7eCeCd0b5DE91C57763304,703154616499999997952);
		mint(0x4c20e140c4944fD0f34109440a0bBfC4cE637e08,15068367014399999737856);
		mint(0x4fE20B08879cd589320425143f5CE7dCB8E5b0d9,2500000000000000000000);
		mint(0x5346cBb19ef357AF39a88F973C54d2129a828066,2756175331999999852544);
		mint(0x550b4c1563a3A7F31b4038f86D957D4220Ed88dE,569616355200000065536);
		mint(0x557e58E79226a14F3Ece117cd7e26ce2cB2d3D59,1333433296200000077824);
		mint(0x579ea3F1e0617Aa237E36C0501822b55bE8D84ED,9158005622799999172608);
		mint(0x58C2006D8032edDD492E1890432d495333cf7894,1361134476900000071680);
		mint(0x595A99fB59993f2Eb86f925902FcD1215eA76cd9,642255777999999991808);
		mint(0x5a291eb7b06f5fb07aab3cf7F31ee0A2E0e8C133,1290698825099999969280);
		mint(0x5A7B3989F13e6418113A6a8DbCe99aB15c0FAbeA,1039143475000000118784);
		mint(0x5c00c26cbd3ABb93fa3c9fD1e345A4Bb7378ea91,503891344600000036864);
		mint(0x5dD49265018041b5fE6a7d13301544Ff7a12b597,1650403003400000110592);
		mint(0x631a1Bc1F624B933113067a449ed81a872416B47,250000000000000000000);
		mint(0x65e335a78FD38CB7f7D206BE51FE36c8bA0397fE,1128357145299999916032);
		mint(0x66Ee3a0CBECaa16243883024aA2Cb0da4312FDfE,350000000000000000000);
		mint(0x67DdD9Ed3e281a88f94C36Fd91792a2aAF77fD06,4625966123099999961088);
		mint(0x68f84EBf869918503A5FC5aAF7889c470d7b13B6,3086469375600000237568);
		mint(0x693F33189dD65fE07aD211C5DB28DeC2c000eF46,2063734586699999870976);
		mint(0x6945681740286c7e504a10Cbd64Cd7f0F2Ef42D5,376209296200000012288);
		mint(0x6C41F6C82e9f714aa2e4260f666203eDbaa3081E,6225146886299999797248);
		mint(0x6Dd43435a449d338582f53A5291668740772D574,3864882149800000094208);
		mint(0x6E46492F1f82bD07544beDC4B89bDF0d3f9272c7,1158666891099999961088);
		mint(0x6E839c93bE68D7272298BD6bC303bF53A58094f2,12896871929499999010816);
		mint(0x6ED318C81e1Dc4b6eD8d1739AC26CE0FD5dC0f97,2000000000000000000000);
		mint(0x7049A0C9c29A7aa500Bb36cF06745df0fF793017,460809950200000020480);
		mint(0x70716CD27Df34405E60D34CBa6C82280751F9D2B,500020000000000000000);
		mint(0x7317A05875FE6Bd6eE65947e615E0220751Cbb6a,6500000000000000000000);
		mint(0x73300B6390F13397E259422A47758419443fee35,1429142282899999948800);
		mint(0x74093CE035265bBBc6680efd05E1eE430e599163,467641432499999997952);
		mint(0x766d9A22a619938Ad8A42606C237dDDF6bFc91D5,734943431999999967232);
		mint(0x7842F19E3066c3d4046D51233d53A8712cC4F87A,18796314160000000851968);
		mint(0x790BD3DE00920E5f545a854d1aca6DA46B92Cd52,380966020800000032768);
		mint(0x79A04ef83d555777d14e515e47E86A117578CD29,306224775700000014336);
		mint(0x79bafB8227C576b0C1bE09A3C4922375A1A4A02f,600000000000000000000);
		mint(0x7A15061Af48e51F13b6EB2966c0Cb86162df805C,557408331399999979520);
		mint(0x7D2d2bC5FB453673c3E31c6b002ef78613165CDC,187890994325500014362624);
		mint(0x7ED4131b2Ca8fC9cC5Ce8508371B4E8cC7590B0E,1578001675199999901696);
		mint(0x80a6b2d796A6381111979D2c56762d9e9e8cf760,331210969700000006144);
		mint(0x80A830311176094cbcB3296BC487496297FAf29C,696557774699999920128);
		mint(0x817d85D5Ea327aC3035dB20c24EfDa02fDeB86F7,4633192992699999846400);
		mint(0x81f3fEdFd1199765fDB2a05d3A0C01E1C032D209,862664303099999944704);
		mint(0x8253EC681fAB6BaeFF2A7017dd386361fc3e5095,598755755299999973376);
		mint(0x83b91F6Cf96DBe31fAfD7f3889F241FaEeA15eFE,512000000000000000000);
		mint(0x8594785b05388737ab07D67da7081A3B421Be1aa,280215600199999979520);
		mint(0x85EcA6187C75482cCb1582B63BA9E9Da30ECF947,804588582100000047104);
		mint(0x8696b6Cc92B860DceaDAAf647f0B7b9E2d19eb57,603990000000000065536);
		mint(0x8763F6C151af0D55b56D94b41B37122B222b7dC4,1282560145600000032768);
		mint(0x898066bB833B0169aAa8A4e0d09dCe2cc7e847C7,2354426839600000139264);
		mint(0x89927bf4A2D285b36703965881BB2eAeA587E819,333338306600000028672);
		mint(0x8C6a242941B91f312ea038146038BF3D8FBd62B6,446171678599999979520);
		mint(0x8Df47d43476e58584AD534C915e104cfc18681Ec,27500028262099999260672);
		mint(0x8E52d4838aAb0AAb352B5dF1c5E186EeB772d90d,259735876699999993856);
		mint(0x913FD10ff059069F538E9F2Efa90190204eCe5F6,1987267272199999848448);
		mint(0x965dEFb5F2c952ca0eA2C568ba4974E4FB2a43da,250000000000000000000);
		mint(0x9742A28Ec591933574Cab52BD2D181F30ECC4C90,300000000000000000000);
		mint(0x97947a5710dcDBafE8ef6B08b3C67C5A0542eF91,259529880699999977472);
		mint(0x97b744CEc5FA3289dEe0A5edcf302D325eA1F696,2854721228100000022528);
		mint(0x99aeA499644D0f902B46Ab5fB3e50cACBFc27504,2000000000000000000000);
		mint(0x9aB3f4a895Fe4Fc4bF5D5B27a75275273300ED18,610228207299999956992);
		mint(0x9B7026B5800B3B57E9ABa310B68789e1a70cB1CB,328778658399999950848);
		mint(0x9c594404Efb9633fF6D36187e2a3D22A7C39E429,820119989100000051200);
		mint(0x9c86Ca855101fCae863346cd41CF5AA3d2217f85,603991733199999991808);
		mint(0x9F94A3f96befa7b9CCEE41496482790a1872100F,457103563499999985664);
		mint(0xa30FE5Cc008D1bB8c9495F5E191f6E6eF08941f0,270301133100000018432);
		mint(0xA31F0089c05F9204c2a3F24B2805c1A09E55ec35,430004163300000006144);
		mint(0xA323724eA2B5a3535060D17aCC46a5bDA8052926,434158681899999952896);
		mint(0xa8ac121056225437c4920d5993C0F03d47D0B51B,2382955687600000073728);
		mint(0xa9a59203d265E84dCE76E3abe42e9FBad01Ec6f1,1673391208300000051200);
		mint(0xB47c9E7ABA5dfdCf166cBB1b877ac70046DA3C15,2760011784400000253952);
		mint(0xB671FE865D087CcDfD3058175eB120853a1A5fE8,8132289214499999711232);
		mint(0xB767690C61CFb58bD024F734C54821FCC1D796E0,523503340900000006144);
		mint(0xB82f260BFb4182A38DabD2291f7ac92894883Fe5,800674302799999926272);
		mint(0xbAB3392864979c61D5939B74160C30758C31a96d,696100488499999932416);
		mint(0xbcdAaf736b22D3B6E047AFc9E32D1c8a0Ae2F228,6277969650199999545344);
		mint(0xBe6e44ff8C358cCec7aC53eE9750Db4779EBd603,1950000000000000000000);
		mint(0xbFCc52172CEfCe34FBf2C93b9e71Da61D5c10cb4,1614536731900000075776);
		mint(0xC0501C2De959B66E79C655b1fD016F6e4C12f262,350509479800000020480);
		mint(0xC4aD95b7bc1CB83479e132B5c0917139904fA488,2521557834800000139264);
		mint(0xC68120512958f2870B605A9764246258B005902A,254265278200000020480);
		mint(0xC6C75E71CB0Dfb8635424b9ed69A8029e919ce70,404389825200000008192);
		mint(0xc8371ba60B5Ae604f42f22Fd9EBe236fd3cF06AA,1618612301900000002048);
		mint(0xc941d53dCee677E91ff0BCCA8A07b37398D65afd,342818229900000034816);
		mint(0xC982118a5A77f6F1bd76300B772a735C0dec004B,45645066911700001751040);
		mint(0xcC74F6b2a76e2D44f2c3382Ba5B11A60dC184709,500000000000000000000);
		mint(0xCCAa398FA4bd82f8e6c2a4d95561f8387dB93ca2,3015689059399999946752);
		mint(0xcF2c4CF58a6074D5e92B3B0508639920069f99B5,625000000000000000000);
		mint(0xD02076408d7EdeF9B31E41BC109C70118241353A,408012218700000002048);
		mint(0xd051248Cf40601fB98B379C409AAD332FE908FF8,1063334524800000065536);
		mint(0xD3a1aB6456c34f384FB000B8cF051F2685667AEB,769939906299999944704);
		mint(0xD47bb23EB4201119e628093f58F415988E54Ac27,1645472568999999963136);
		mint(0xD4c4808997096dF6EC5927dcf967f4D67cB57213,752108247800000020480);
		mint(0xD5e54c5e54A8cDb7cC11D0D33ff12e7bCD26bbb7,485834941200000024576);
		mint(0xd6e1f4342C0D8D5E08c74e9e1738EC137355276e,1600000000000000000000);
		mint(0xdfCD5F190345aFB7Cd7fff92505dB6d9d37624b4,111300594440400004972544);
		mint(0xDfdcaB6cA3C28FC1b9120d8F80496A2A31717F91,12856214555599998812160);
		mint(0xE02349873e4Df2c062494fCDeD295e175CEB7701,1000000000000000000000);
		mint(0xE0f9929D19100F006d3D11A421A33E638291412f,1079053033299999981568);
		mint(0xE159E2feB61c926f6eE31a7Aed94eADBED4431E5,10257430913400000479232);
		mint(0xe1736f901f64E48cCec28525bdA55bdbeF9Af129,5191774558799999795200);
		mint(0xE254E6b9a50a2EE963f6926A3406271D8F8Db831,1045482886999999905792);
		mint(0xE56cF001935EC55F867Ce7d77383cC61f39B2783,500000000000000000000);
		mint(0xe5fef01d78ebE6393aD0b6049CA754CD2294d41C,1017194319499999969280);
		mint(0xe6338AdB219F4376Dea89eA657eaf8ec24F7eB08,4452625535400000618496);
		mint(0xe7E2b23B2Ff4E90d2a3e98ef4DFBF687b516F190,1048929569700000038912);
		mint(0xE8764d2Cee09BC196DDB9952080AE7D7EC3FD47d,300000000000000000000);
		mint(0xEa67B4Da12971127009DedC855c1f9cDA1B118E1,2376619856899999793152);
		mint(0xEbA59b7203c52Ce25Db3Fb14eFEDc605e94FB13F,2594961055899999797248);
		mint(0xf074969E0886c3cA6cAb8313fFa7926A7027aC95,525940427000000020480);
		mint(0xf701EFa1d6baec4FABEd929DE4ade5288AD38c0C,1144222299000000086016);
		mint(0xF9dB1c8a7c050Dbd221443bDEdf801451C7AF7EA,1568234828699999928320);
		mint(0xfd29a1deD6B7958f8DE95Af61bb053eA33Bc32CD,379997744599999971328);
		mint(0xFD9Cba84dC8d0b828661593ddBDdB8d4614d2565,424389291599999991808);
		mint(0xfF59f3a717DEbc1baa57ed7fE643979E0349490c,750000000000000000000);
		mint(0xffCbB665976917cfEeb8C9006faf1D7775dD685A,3614470276600000151552);

		emit InitialCoindrop();
	}

    constructor() {
        owner = msg.sender;
        emit TransferOwnership(address(0), msg.sender);
		isIssuer[msg.sender] = true;
        emit IssuerRights(msg.sender, true);
		initialCoindrop();
    }
}