# 🌐 ttxgotime.xyz DNS Setup Guide

## Domain Information
- **Domain:** ttxgotime.xyz
- **DNS Provider:** CloudNS
- **VPS IP:** 94.156.232.142
- **IPv6:** 2a0e:d604:1:45d::/64

## DNS Configuration Steps

### 1. Log into CloudNS
1. Go to [CloudNS.net](https://www.cloudns.net)
2. Log into your account
3. Find "ttxgotime.xyz" in your domain list
4. Click "Manage" or "DNS settings"

### 2. Add Required DNS Records

You need to add these records to your CloudNS DNS:

#### A Record (IPv4)
```
Type: A
Name: @
Value: 94.156.232.142
TTL: 300
```

#### AAAA Record (IPv6)
```
Type: AAAA
Name: @
Value: 2a0e:d604:1:45d::/64
TTL: 300
```

#### WWW Subdomain
```
Type: A
Name: www
Value: 94.156.232.142
TTL: 300
```

#### CNAME for www (Alternative)
```
Type: CNAME
Name: www
Value: ttxgotime.xyz
TTL: 300
```

### 3. CloudNS Interface Steps

1. **Click "Add Record"**
2. **For A Record:**
   - Type: A
   - Name: @ (or leave blank)
   - Value: 94.156.232.142
   - TTL: 300
   - Click "Add"

3. **For AAAA Record:**
   - Type: AAAA
   - Name: @ (or leave blank)
   - Value: 2a0e:d604:1:45d::/64
   - TTL: 300
   - Click "Add"

4. **For WWW Record:**
   - Type: A
   - Name: www
   - Value: 94.156.232.142
   - TTL: 300
   - Click "Add"

### 4. Verify DNS Records

After adding the records, your DNS should look like this:

```
Type    Name    Value                    TTL
A       @       94.156.232.142          300
AAAA    @       2a0e:d604:1:45d::/64    300
A       www     94.156.232.142          300
NS      @       pns61.cloudns.net       -
NS      @       pns62.cloudns.com       -
NS      @       pns63.cloudns.net       -
NS      @       pns64.cloudns.uk        -
```

### 5. Test DNS Propagation

After saving the DNS records, test propagation:

```bash
# Test A record
nslookup ttxgotime.xyz
dig ttxgotime.xyz A

# Test AAAA record
nslookup -type=AAAA ttxgotime.xyz
dig ttxgotime.xyz AAAA

# Test www subdomain
nslookup www.ttxgotime.xyz
```

### 6. Expected Results

After DNS propagation (5-30 minutes), you should see:

```
ttxgotime.xyz.    300    IN    A    94.156.232.142
www.ttxgotime.xyz. 300   IN    A    94.156.232.142
```

## Next Steps

1. **Wait for DNS propagation** (5-30 minutes)
2. **Deploy files to VPS** (see deploy instructions)
3. **Test domain access**
4. **Configure SSL certificate**
5. **Test cloaking functionality**

## Troubleshooting

### DNS Not Propagating
- Wait up to 24 hours for full propagation
- Check with different DNS lookup tools
- Clear your browser cache

### Domain Not Resolving
- Verify DNS records are correct
- Check if VPS is accessible via IP
- Ensure port 80 and 443 are open on VPS

### SSL Issues
- Set up SSL certificate after DNS is working
- Use Let's Encrypt for free SSL
- Ensure domain is pointing to VPS first
